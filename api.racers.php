<?php
    require_once("api.interface.php");

//A Racer is a Swimmer that has been assigned to a race
class Racers extends APIInterface
{

    //Constructor - make sure db gets connected
    public function __construct()
    {
        parent::__construct();
    }

    //API Method to GET Swimmers not assigned to a race
    public function nonracers()
    {
        try
        {
            $result = $this->get_sproc("GET_NONRACERS");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":"-1"}',400);
        }
    }

    //API Method to GET Count of Racers by RaceID
    public function racerCount()
    {
    }


    //API Method to GET Swimmers assigned to a race
    public function racers()
    {
        try
        {
            $result = $this->get_sproc("GET_RACERS");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":"-1"}',400);
        }
    }

    //API Method to GET the list of racers that have finished, in order of finish
    public function finishorder()
    {
        try
        {
            $result = $this->get_sproc("GET_FINISHORDER");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":"-1"}',400);
        }
    }

    //API Method to GET the list of racers that have finished, in order, by race
    public function racefinishers()
    {
        try
        {
            $result = $this->get_sproc("GET_RACEFINISHERS");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":"-1"}',400);
        }
    }

    //API Metod to get the count of race finishers
    public function racefinishercount()
    {
        try
        {
            $result = $this->get_sproc("GET_RACEFINISHERCOUNTS");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":"-1"}',400);
        }
    }

    //API Method to get the racers currently in the water
    public function racersswimming()
    {
        try
        {
            $result = $this->get_sproc("SP_GETRACERSSWIMMING");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":"-1"}',400);
        }
    }

    //API Method to add a racer
    public function addracer()
    {
        try
        {
            //Expected format: {"RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}
            $postjson = json_decode(file_get_contents("php://input"),true);
            $swimmer = (int)$postjson['SwimmerID'];
            $race = (int)$postjson['RaceID'];
            $racernumber = (int)$postjson['RacerNumber'];
            $hasfins = (int)$postjson['HasFins'];

            $result = $this->call_sproc("INSERT_RACER($racernumber, $swimmer, $race, $hasfins)");
            $this->response($this->json($result), 200);
        }
        catch (Exception $e)
        {
            error_log($e);
            $this->response('{"ID":-1}',400);
        }
    }

    //API Method to update a swimmer
    public function editracer()
    {
        try
        {
            //Expected format: {"ID":"5","RacerNumber":123, "SwimmerID":1, "RaceID":1, "HasFins":0}
            $postjson = json_decode(file_get_contents("php://input"),true);
            $id = (int)$postjson['ID'];
            $swimmer = (int)$postjson['SwimmerID'];
            $race = (int)$postjson['RaceID'];
            $racernumber = (int)$postjson['RacerNumber'];
            $hasfins = (int)$postjson['HasFins'];

            try
            {
                $result = $this->call_sproc("UPDATE_RACESWIMMERS($id, $swimmer, $race, $racernumber, $hasfins)");
                $this->response($this->json($result), 200);
            }
            catch (Exception $e)
            {
                error_log($e);
                $this->response('{"ID":"-1"}',400);
            }

        }
        catch (Exception $e)
        {
            $this->response('{"ID":"-1"}',400);
        }
    }
}
?>
